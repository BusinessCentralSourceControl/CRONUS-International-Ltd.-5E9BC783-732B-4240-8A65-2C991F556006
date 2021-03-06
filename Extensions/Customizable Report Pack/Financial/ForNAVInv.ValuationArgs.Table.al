Table 6188713 "ForNAV Inv. Valuation Args."
{
    // Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
    // The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
    // Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
    // This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.


    fields
    {
        field(1; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = SystemMetadata;
        }
        field(2; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = SystemMetadata;
        }
        field(3; "Expected Cost"; Boolean)
        {
            Caption = 'Expected Cost';
            DataClassification = SystemMetadata;
        }
        field(4; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = SystemMetadata;
        }
        field(5; Value; Decimal)
        {
            Caption = 'Value';
            DataClassification = SystemMetadata;
        }
        field(6; "Increases (LCY)"; Decimal)
        {
            Caption = 'Increases (LCY)';
            DataClassification = SystemMetadata;
        }
        field(7; "Decreases (LCY)"; Decimal)
        {
            Caption = 'Decreases (LCY)';
            DataClassification = SystemMetadata;
        }
        field(8; "Cost Posted to G/L"; Boolean)
        {
            Caption = 'Cost Posted to G/L';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Starting Date")
        {
        }
    }

    fieldgroups
    {
    }
}

