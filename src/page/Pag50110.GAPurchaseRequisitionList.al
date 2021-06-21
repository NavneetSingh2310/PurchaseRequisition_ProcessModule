page 50110 "GA Purchase Requisition List"
{
    Caption = 'GA Purchase Requisition List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Purchase Requisition";
    CardPageId = "Purchase Requisition Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Documant No."; "Document No.") { ApplicationArea = All; }
                field("Requestor Name"; "Requestor Name") { }
                field("Document Type."; "Document Type.") { }
                field("Department Name"; "Department Name") { }
                field("Location Code"; "Location Code") { }
                field(status; status) { }
                field("Document Date"; "Document Date") { }
                field("Release Date"; "Release Date") { }
                field("User Id"; "User Id") { }
                field("Last Modification"; "Last Modification") { }
                field("Request For"; "Request For")
                {
                    Visible = false;
                }



            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Print Report")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    _report: Report 50110;
                begin
                    Report.RunModal(50111, false, false, Rec);


                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        code_unit: Codeunit "PR Codeunit";
    begin
        code_unit.SetDepartment('GA Dept');
        SetFilter("Request For", 'GA Dept');
    end;





}