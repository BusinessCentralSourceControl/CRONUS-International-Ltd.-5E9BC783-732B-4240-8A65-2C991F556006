Page 6188472 "ForNAV Legal Cond. Translation"
{
    ApplicationArea = All;
    Caption = 'ForNAV Legal Cond. Translation';
    PageType = List;
    SourceTable = "ForNAV Legal Cond. Translation";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(LanguageCode; Rec."Language Code")
                {
                    ApplicationArea = All;
                }
                field(LegalConditions; Rec."Legal Conditions")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
