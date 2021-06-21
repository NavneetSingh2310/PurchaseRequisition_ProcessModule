table 50110 "Purchase Requisition"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[15])
        {

            DataClassification = ToBeClassified;

        }
        field(2; "Requestor Name"; Text[30])
        {

            DataClassification = ToBeClassified;
        }
        field(3; "Document Type."; Option)
        {
            OptionMembers = "Direct Expense","Inventory Asset","Fixed Asset";
            DataClassification = ToBeClassified;
        }
        field(4; "Department Name"; Text[30])
        {

            DataClassification = ToBeClassified;
        }
        field(5; "Location Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "status"; Option)
        {
            OptionMembers = "Open","Pending Approval","Released";

            DataClassification = ToBeClassified;
        }
        field(7; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Release Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "User Id"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Last Modification"; date)
        {
            DataClassification = ToBeClassified;

        }
        field(11; "Remarks"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Request For"; Text[30])
        {


            DataClassification = ToBeClassified;
        }
        field(13; "Creator Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Reviewer"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Approver"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Total Requests"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Store issuance Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }



    }


    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Document No.", "Request For", "Creator Name", "Document Date") { }
    }
}