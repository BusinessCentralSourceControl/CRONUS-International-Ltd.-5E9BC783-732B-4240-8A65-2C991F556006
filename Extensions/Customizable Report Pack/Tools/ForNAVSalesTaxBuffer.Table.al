Table 6189469 "ForNAV Sales Tax Buffer"
{
    Caption = 'Sales Tax Buffer', Comment = 'DO NOT TRANSLATE';

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Exempt Amount"; Decimal)
        {
            Caption = '', Comment = 'DO NOT TRANSLATE';
            DataClassification = SystemMetadata;
        }
        field(3; "Taxable Amount"; Decimal)
        {
            Caption = '', Comment = 'DO NOT TRANSLATE';
            DataClassification = SystemMetadata;
        }
    }

    keys { key(Key1; "Primary Key") { } }
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
