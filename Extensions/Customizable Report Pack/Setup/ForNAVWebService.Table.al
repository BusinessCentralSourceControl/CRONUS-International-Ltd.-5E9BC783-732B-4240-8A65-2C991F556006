Table 6188473 "ForNAV Web Service"
{
    Caption = 'Web Service', Comment = 'DO NOT TRANSLATE';

    fields
    {
        field(3; "Object Type"; Option)
        {
            Caption = 'Object Type', Comment = 'DO NOT TRANSLATE';
            DataClassification = SystemMetadata;
            OptionCaption = ',,,,,Codeunit,,,Page,Query', Comment = 'DO NOT TRANSLATE';
            OptionMembers = ,,,,,"Codeunit",,,"Page","Query";
        }
        field(6; "Object ID"; Integer)
        {
            Caption = 'Object ID', Comment = 'DO NOT TRANSLATE';
            DataClassification = SystemMetadata;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = field("Object Type"));
        }
        field(9; "Service Name"; Text[240])
        {
            Caption = 'Service Name', Comment = 'DO NOT TRANSLATE';
            DataClassification = SystemMetadata;
        }
        field(12; Published; Boolean)
        {
            Caption = 'Published', Comment = 'DO NOT TRANSLATE';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Object Type", "Service Name")
        {
        }
        key(Key2; "Object Type", "Object ID")
        {
        }
    }

}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
