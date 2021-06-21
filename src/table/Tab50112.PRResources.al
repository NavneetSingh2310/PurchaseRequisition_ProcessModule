table 50112 "PR Resources"
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
            AutoIncrement = true;
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
            NotBlank = true;

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
            TableRelation = "Bank Account"."No.";
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
        field(17; Processed; Boolean)
        {

            DataClassification = ToBeClassified;
        }
        field(18; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Direct Unit Cost Excl. VAT "; Decimal)
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(20; "Line Amount Excl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Line Discount %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Quantity to Receive"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Quantity Received"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Expected Receipt Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }
        field(26; "Quantity to issue"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Outstanding Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Quantity Issued"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Quantity to Cancel"; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; ID, "Line No.", "Item No.")
        {
            Clustered = true;
        }
    }



}