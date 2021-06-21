report 50110 "Purchase Requisition Form"
{
    Caption = 'Purchase Requisition Form';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\PurchaseRequisitionReport.rdl';
    ShowPrintStatus = true;


    dataset
    {
        dataitem("Purchase Requisition"; "Purchase Requisition")
        {
            column("COMPANY_NAME"; CompanyName) { }
            column(Creator_Name; "Creator Name") { }

            column(Department_Name; "Department Name") { }
            column(Document_Date; "Document Date") { }
            column(Document_No_; "Document No.") { }
            column(Document_Type_; "Document Type.") { }
            column(Last_Modification; "Last Modification") { }
            column(Location_Code; "Location Code") { }
            column(Release_Date; "Release Date") { }
            column(Remarks; Remarks) { }
            column(Request_For; "Request For") { }
            column(Requestor_Name; "Requestor Name") { }
            column(status; status) { }
            column(SystemId; SystemId) { }
            column(User_Id; "User Id") { }
            column(Approver; Approver) { }
            column(Reviewer; Reviewer) { }


            dataitem("PR Resources"; "PR Resources")
            {



                DataItemLinkReference = "Purchase Requisition";
                DataItemLink = ID = field("Document No.");
                column(serialNo; serialNo) { }
                column(Item_No_; "Item No.") { }
                column(Date_Needed; "Date Needed") { }
                column(Deptt__Code; "Deptt. Code") { }
                column(Description; Description) { }
                column(Description2; Description2) { }
                column(Direct_Unit_Cost_Excl__VAT_; "Direct Unit Cost Excl. VAT ") { }
                column(Document_Type; "Document Type") { }
                column(Expected_Receipt_Date; "Expected Receipt Date") { }
                column(ID; ID) { }
                column(Line_Discount__; "Line Discount %") { }
                column(Line_Amount_Excl__VAT; "Line Amount Excl. VAT") { }
                column(Line_No_; "Line No.") { }
                //column(Location_Code; "Location Code") { }
                column(PR_Status; "PR Status") { }
                column(Processed; Processed) { }
                column(Purpose; Purpose) { }
                column(Quantity; Quantity) { }
                column(Quantity_Received; "Quantity Received") { }
                column(Quantity_to_Receive; "Quantity to Receive") { }
                column(Requested_Qunatity; "Requested Qunatity") { }
                column(Register_User_Id; "Register User Id") { }
                column(Registered_User_Name; "Registered User Name") { }
                column(Total_Amount; "Total Amount") { }
                column(Sub_Account_Code; "Sub.Account Code") { }
                column(Type; Type) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                trigger OnAfterGetRecord()

                begin
                    serialNo := serialNo + 1;
                end;

            }

        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }


    trigger OnInitReport()
    begin
        serialNo := 0;
    end;

    var
        serialNo: Integer;
}