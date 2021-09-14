Codeunit 6188481 "ForNAV Check Setup"
{
    TableNo = "ForNAV Setup";

    trigger OnRun()
    var
        CheckSetup: Record "ForNAV Check Setup";
    begin
        CreateCheckSetupRecord(CheckSetup);
        SetCheckType(Rec, CheckSetup);
    end;

    procedure CreateCheckSetupRecord(var CheckSetup: Record "ForNAV Check Setup")
    begin
        CheckSetup.InitSetup;
    end;

    procedure SetCheckType(Setup: Record "ForNAV Setup"; var CheckSetup: Record "ForNAV Check Setup")
    var
        IsSalesTax: Codeunit "ForNAV Is Sales Tax";
    begin
        if IsSalesTax.CheckIsSalesTax then
            CheckSetup.Validate(Layout, CheckSetup.Layout::"Check-Stub-Stub")
        else
            CheckSetup.Validate(Layout, CheckSetup.Layout::" ");
        CheckSetup.Modify;
    end;
}

// Copyright (c) 2018-2020 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.