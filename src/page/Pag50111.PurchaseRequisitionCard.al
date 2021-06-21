page 50111 "Purchase Requisition Card"
{
    Caption = 'Purchase Requisition Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase Requisition";


    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = page_editable;
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    NotBlank = true;

                    trigger OnAssistEdit()
                    var
                        Series_Page: Page "No. Series List";
                        Series_Table: Record "No. Series";
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                        CurrentSeries: Code[15];
                        Series: Record "No. Series";
                        code_unit: Codeunit "PR Codeunit";


                    begin
                        Series_Table.Reset();
                        Series_Table.SetFilter(Code, '*-PR');
                        Clear(Series_Page);
                        Series_Page.SetRecord(Series_Table);
                        Series_Page.SetTableView(Series_Table);
                        Series_Page.LookupMode(true);

                        IF Series_Page.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            Series_Page.GetRecord(Series_Table);
                            "Document No." := Series_Table.Code;
                            CurrentSeries := "Document No.";
                            Series.Get(CurrentSeries);
                            "Document No." := NoSeriesMgt.GetNextNo("Document No.", 0D, true);
                            if CurrentSeries = 'GA-DE-PR' then
                                "Document Type." := "Document Type."::"Direct Expense"
                            else
                                if CurrentSeries = 'GA-IN-PR' then
                                    "Document Type." := "Document Type."::"Inventory Asset"
                                else
                                    if CurrentSeries = 'GA-PR' then
                                        "Document Type." := "Document Type."::"Fixed Asset";
                            code_unit.SetCurrentDocumetNo("Document No.");

                            "User Id" := UserId;
                            "Creator Name" := UserId;
                            "Department Name" := 'IT Sec';
                            status := status::Open;
                            "Document Date" := Today;
                            "Last Modification" := Today;
                            listPart_editable := true;

                        end


                    end;






                }

                field("Request For"; "Request For") { ApplicationArea = All; Editable = false; }
                field("Document Type."; "Document Type.") { ApplicationArea = All; Editable = false; }
                field("Creater ID"; "User Id") { ApplicationArea = All; Editable = false; }
                field("Creator Name"; "Creator Name") { ApplicationArea = All; Editable = false; }
                field("Department Name"; "Department Name") { ApplicationArea = All; Editable = false; }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = All;
                    TableRelation = Location;
                }
                field(status; status) { ApplicationArea = All; Editable = false; }
                field("Document Date"; "Document Date") { ApplicationArea = All; Editable = false; }
                field("Release Date"; "Release Date") { ApplicationArea = All; Editable = false; }
                field(Remarks; Remarks) { ApplicationArea = All; }


            }

            part("Open Purchase Req. Lines"; "PR Request Line ListPart")
            {
                SubPageLink = ID = field("Document No.");
                Editable = listPart_editable;
                ApplicationArea = All;

            }


        }
    }

    actions
    {
        area(Processing)
        {

            action("Send For Approval")
            {
                ApplicationArea = All;
                Image = SendApprovalRequest;
                Promoted = true;
                Enabled = page_editable;


                trigger OnAction()
                var
                    code_unit: Codeunit "PR Codeunit";
                    PRResources: Record "PR Resources";
                    total_resources: Integer;

                begin
                    PRResources.SetRange(ID, "Document No.");
                    if PRResources.FindSet() then begin
                        if status = status::Open then begin
                            code_unit.SendForApproval("Document No.");
                            page_editable := false;
                            listPart_editable := false;

                        end
                        else
                            Message('Status must be Open');

                    end
                    else
                        Message('Nothing to send for approval');


                end;
            }
            action("Reopen")
            {
                ApplicationArea = All;
                Image = ReOpen;
                Promoted = true;
                Enabled = reopen_enabled;

                trigger OnAction()
                var
                    code_unit: Codeunit "PR Codeunit";
                begin
                    if status = status::"Pending Approval" then
                        code_unit.ReOpen("Document No.")
                    else
                        if status = status::Released then
                            Message('Can not be re-open as document is already released')
                        else
                            if status = status::Open then
                                Message('Document is already Open');
                    page_editable := true;
                    listPart_editable := true;


                end;
            }
            action("Report")
            {
                Image = Report;
                Promoted = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    report1: Report "Purchase Requisition Form";
                    PR: Record "Purchase Requisition";
                begin

                    PR.SetRange("Document No.", "Document No.");
                    if PR.FindSet() then begin
                        report1.SetTableView(PR);
                        report1.Run();
                    end;

                end;
            }
        }
    }



    trigger OnNewRecord(BelowxRec: Boolean)
    var
        code_unit: Codeunit "PR Codeunit";
    begin

        "Request For" := code_unit.GetDepartment();
        page_editable := true;

        reopen_enabled := false;

    end;





    trigger OnAfterGetRecord()
    begin

        if status = status::Released then begin
            page_editable := false;
            reopen_enabled := false;
            listPart_editable := false;
        end
        else
            if status = status::"Pending Approval" then begin
                page_editable := false;
                reopen_enabled := true;
                listPart_editable := false;
            end
            else begin
                page_editable := true;
                reopen_enabled := false;
                if "Document No." = '' then
                    listPart_editable := false
                else
                    listPart_editable := true;
            end;




    end;

    var
        page_editable: Boolean;
        reopen_enabled: Boolean;
        listPart_editable: Boolean;

}

