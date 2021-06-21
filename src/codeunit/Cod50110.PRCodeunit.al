codeunit 50110 "PR Codeunit"
{
    SingleInstance = true;

    procedure SetDepartment(name: Text)
    begin
        Dept := name;
    end;

    procedure GetDepartment(): Text
    begin
        exit(Dept);
    end;

    procedure SetCurrentDocumetNo(no: Code[20])
    begin
        Current_Doc_no := no;
    end;

    procedure GetCurrentDocumentNo(): Code[20]
    begin
        exit(Current_Doc_no);
    end;

    procedure SendForApproval(DocNo: Code[20])
    var
        rec: Record "Purchase Requisition";
        Request: Record "Approval Entry";
        userSetup: Record "User Setup";
        PRResources: Record "PR Resources";
        Total_Amount: Decimal;
    begin

        rec.Get("DocNo");
        rec.status := rec.status::"Pending Approval";

        Request."Record ID to Approve" := Rec.RecordId;

        // if UserId = 'ADMIN' then begin
        //     Request."Approver ID" := UserId;
        //     rec.Approver := UserId;
        //     rec.Reviewer := UserId;
        // end
        // else begin
        //     userSetup.Get(UserId);
        //     Request."Approver ID" := userSetup."Approver ID";
        // end;
        userSetup.Get(UserId);
        if userSetup."Approver ID" = '' then begin
            Request."Approver ID" := UserId;
            rec.Approver := UserId;
            rec.Reviewer := UserId;
        end
        else
            Request."Approver ID" := userSetup."Approver ID";
        rec.Modify();
        Total_Amount := 0;
        PRResources.SetRange(ID, DocNo);
        if PRResources.FindSet() then
            repeat
                Total_Amount := Total_Amount + PRResources."Total Amount";
            until PRResources.Next() = 0;
        Request.Amount := Total_Amount;
        Request."Amount (LCY)" := Total_Amount;
        Request."Currency Code" := 'INR';
        Request.Status := Request.Status::Open;
        Request."Document No." := DocNo;
        Request."Sender ID" := UserId;

        Request.Insert();
        Message('An approval request has been sent.');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    local procedure ApproveInPRTable(approvalEntry: Record "Approval Entry")
    var
        rec: Record "Purchase Requisition";
        myNotification: Notification;
        userSetup: Record "User Setup";
        Request: Record "Approval Entry";
        ReleasedPRLines: Record "PR Released Resources";
        AllResources: Record "PR Resources";
        recref: RecordRef;

        rec2: Record "Purchase Requisition";

    begin
        recref.Get(approvalEntry."Record ID to Approve");
        userSetup.get(approvalEntry."Approver ID");
        if userSetup."Approver ID" <> '' then begin

            Request."Record ID to Approve" := approvalEntry."Record ID to Approve";
            Request."Approver ID" := userSetup."Approver ID";
            Request.Status := Request.Status::Open;
            Request."Document No." := approvalEntry."Document No.";
            Request."Sender ID" := userSetup."User ID";

            Request.Insert();
            case recref.Number of
                database::"Purchase Requisition":
                    begin
                        rec2.Get(approvalEntry."Document No.");
                        rec2.Reviewer := userSetup."User ID";
                        rec2.Modify();

                    end;

            end;

            myNotification.Message('Approval Request Reviewed and Send for further Approval');
            myNotification.Send();

        end
        else begin

            case recref.Number of
                Database::"Purchase Requisition":
                    begin

                        rec.Get(approvalEntry."Document No.");
                        rec.status := rec.status::Released;
                        rec.Approver := userSetup."User ID";
                        AllResources.SetRange(ID, rec."Document No.");
                        if AllResources.FindSet() then
                            repeat
                                AllResources.Processed := true;
                                AllResources.Modify();

                            until AllResources.Next() = 0;
                        rec.Modify();
                        myNotification.Message('Approved');
                        myNotification.Send();

                    end;


            end;



        end;


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    local procedure RejectInPRTable(approvalEntry: Record "Approval Entry")
    var
        rec: Record "Purchase Requisition";
        myNotification: Notification;
        recref: RecordRef;

    begin
        recref.Get(approvalEntry."Record ID to Approve");
        case recref.Number of
            Database::"Purchase Requisition":
                begin
                    rec.Get(approvalEntry."Document No.");
                    rec.status := rec.status::Open;
                    rec.Modify();
                end;

        end;

        myNotification.Message('Rejected');
        myNotification.Send();

    end;


    procedure ReOpen(DocNo: Code[20])
    var
        Request: Record "Approval Entry";
        rec: Record "Purchase Requisition";

    begin
        rec.Get(DocNo);
        Request.SetRange("Document No.", DocNo);


        if Request.FindSet() then
            repeat
                if Request.Status = Request.Status::Open then begin
                    Request.DeleteAll();
                    rec.status := rec.status::Open;
                    rec.Modify();
                    Message('Document Re-opened!');
                end;

            until Request.Next() = 0
        else
            Error('No such Appoval request found!');
    end;







    var
        Dept: Text[20];
        Current_Doc_no: Code[20];


}