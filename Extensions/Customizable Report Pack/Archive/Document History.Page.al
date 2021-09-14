page 6189105 "ForNAV Document History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ForNAV Document History";
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    SourceTableView = sorting("Archive ID", "Archive Timestamp", "User ID") order(ascending);
    Caption = 'ForNAV Document Archive History';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(DateTime; Rec."Archive Timestamp")
                {
                    ApplicationArea = All;
                }
                field(UserId; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec."Archive Action")
                {
                    Caption = 'Actions';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        archive: Record "ForNAV Document Archive";
    begin
        Rec.FindFirst();
        archive.SetRange(archive."Archive ID", Rec."Archive ID");
        archive.FindFirst();
        CurrPage.Caption := CurrPage.Caption + ' - ' + archive."Report Name";
    end;
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
