page 50112 "PR Locations List"
{
    Caption = 'Locations List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "PR Locations";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(City; City)
                {
                    ApplicationArea = All;
                }

            }

        }

    }



}