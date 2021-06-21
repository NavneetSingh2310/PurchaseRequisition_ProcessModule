table 50111 "PR Locations"
{
    DataClassification = ToBeClassified;
    LookupPageId = "PR Locations List";

    fields
    {
        field(1; City; Text[30])
        {
            DataClassification = ToBeClassified;

        }
    }



    keys
    {
        key(PK; City)
        {
            Clustered = true;
        }
    }


}