Table 6188682 "ForNAV Vendor Payments Args."
{
    fields
    {
        field(1; "Consider Discount"; Boolean)
        {
            Caption = 'Consider Discount';
            DataClassification = SystemMetadata;
        }
        field(2; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
            DataClassification = SystemMetadata;
        }
        field(3; "Due Date Filter"; Date)
        {
            Caption = 'Due Date Filter';
            DataClassification = SystemMetadata;
        }
        field(4; "Payment Discount Date"; Date)
        {
            Caption = 'Payment Discount Date';
            DataClassification = SystemMetadata;
        }
        field(5; "Print Amounts in LCY"; Boolean)
        {
            Caption = 'Print Amounts in LCY';
            DataClassification = SystemMetadata;
        }
        field(6; "External Document No."; Boolean)
        {
            Caption = 'External Document No.';
            DataClassification = SystemMetadata;
        }
        field(7; "Total Amount (LCY)"; Decimal)
        {
            Caption = 'Total Amount (LCY)';
            DataClassification = SystemMetadata;
        }
    }

    keys
    { key(Key1; "Consider Discount") { } }
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
