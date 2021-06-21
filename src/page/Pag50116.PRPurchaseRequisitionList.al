page 50116 "PR Purchase Requisition List"
{
    Caption = 'PR Purchase Requisition List';
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
                field("Requestor Name"; "Requestor Name") { ApplicationArea = All; }
                field("Document Type."; "Document Type.") { ApplicationArea = All; }
                field("Department Name"; "Department Name") { ApplicationArea = All; }
                field("Location Code"; "Location Code") { ApplicationArea = All; }
                field(status; status) { ApplicationArea = All; }
                field("Document Date"; "Document Date") { ApplicationArea = All; }
                field("Release Date"; "Release Date") { ApplicationArea = All; }
                field("User Id"; "User Id") { ApplicationArea = All; }
                field("Last Modification"; "Last Modification") { ApplicationArea = All; }
                field("Request For"; "Request For")
                {
                    ApplicationArea = All;
                    Visible = false;
                }


            }
        }

    }

    trigger OnOpenPage()
    var
        code_unit: Codeunit "PR Codeunit";
    begin
        code_unit.SetDepartment('PR Dept');
        SetFilter("Request For", 'PR Dept');
    end;





}