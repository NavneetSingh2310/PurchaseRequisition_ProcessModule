table 50113 "PR Released Resources"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Item","Asset";
        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";

        }
        field(5; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";

        }
        field(6; "Description"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Description2"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Requested Qunatity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Register User Id"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Registered User Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Deptt. Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Sub.Account Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Date Needed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Purpose"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "PR Status"; Option)
        {
            OptionMembers = "Open","Pending Approval","Released";
        }
        field(16; "Document Type"; Option)
        {
            OptionMembers = "Direct Expense","Inventory Asset","Fixed Asset";
        }
    }

    keys
    {
        key(PK; ID, "Line No.")
        {
            Clustered = true;
        }
    }




}