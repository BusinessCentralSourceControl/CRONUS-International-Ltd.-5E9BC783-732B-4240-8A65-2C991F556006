Table 6188678 "ForNAV Reconcile AP to GL Buf."
{
    // Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
    // The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
    // Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
    // This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.


    fields
    {
        field(10; "Account No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
        }
        field(20; "Account Name"; Text[30])
        {
            Caption = 'Name';
            DataClassification = SystemMetadata;
        }
        field(30; "Debit Amount"; Decimal)
        {
            Caption = 'Debit Amount';
            DataClassification = SystemMetadata;
        }
        field(40; "Credit Amount"; Decimal)
        {
            Caption = 'Credit Amount';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Account No.")
        {
        }
    }

    fieldgroups
    {
    }
}

