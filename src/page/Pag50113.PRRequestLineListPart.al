page 50113 "PR Request Line ListPart"
{
    Caption = 'Open Purchase Request Line';
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
                field(ID; ID)
                {
                    ApplicationArea = All;
                    Visible = false;
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
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    trigger OnValidate()
                    var
                        Item: Record Item;
                        code_unit: Codeunit "PR Codeunit";
                    begin
                        Item.Get("Item No.");
                        Description := Item.Description;
                        "Register User Id" := UserId;
                        "Registered User Name" := UserId;
                        "Deptt. Code" := code_unit.GetDepartment();
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
                field("Location Code"; "Location Code") { ApplicationArea = all; }
                field("Requested Qunatity"; "Requested Qunatity")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin

                        "Total Amount" := "Requested Qunatity" * "Direct Unit Cost Excl. VAT ";
                        "Outstanding Quantity" := "Requested Qunatity";
                    end;

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
                // field(Quantity; Quantity) { }
                // field("Quantity to Receive"; "Quantity to Receive") { }
                // field("Quantity Received"; "Quantity Received") { }
                field("Expected Receipt Date"; "Expected Receipt Date") { }
                field("Direct Unit Cost Excl. VAT "; "Direct Unit Cost Excl. VAT ")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin

                        "Total Amount" := "Requested Qunatity" * "Direct Unit Cost Excl. VAT ";
                    end;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        "Total Amount" := "Total Amount" - (("Line Discount %" / 100) * "Total Amount");
                    end;
                }
                field("Total Amount"; "Total Amount") { ApplicationArea = All; }



            }
        }
    }


}