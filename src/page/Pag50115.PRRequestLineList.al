page 50115 "PR Request Line List"
{
    Caption = 'PR Request Line List';
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "PR Resources";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Processed; Processed)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(ID; ID)
                {
                    ApplicationArea = All;

                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        code_unit: Codeunit "PR Codeunit";
                    begin
                        ID := code_unit.GetCurrentDocumentNo();
                    end;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Item: Record Item;
                    begin
                        Item.Get("Item No.");
                        Description := Item.Description;
                    end;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Description2; Description2)
                {
                    ApplicationArea = All;
                }
                field("Requested Qunatity"; "Requested Qunatity")
                {
                    ApplicationArea = All;
                }
                field("Register User Id"; "Register User Id")
                {
                    ApplicationArea = All;
                }
                field("Registered User Name"; "Registered User Name")
                {
                    ApplicationArea = All;
                }
                field("Deptt. Code"; "Deptt. Code")
                {
                    ApplicationArea = All;
                }
                field("Sub.Account Code"; "Sub.Account Code")
                {
                    ApplicationArea = All;
                }
                field("Date Needed"; "Date Needed")
                {
                    ApplicationArea = All;
                }
                field(Purpose; Purpose)
                {
                    ApplicationArea = All;
                }

            }
        }
    }


}