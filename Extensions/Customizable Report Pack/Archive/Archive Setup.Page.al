page 6189104 "ForNAV Document Archive Setup"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ForNAV Document Archive Setup";
    Caption = 'ForNAV Document Archive Setup';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec."Report ID")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec."Report Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
