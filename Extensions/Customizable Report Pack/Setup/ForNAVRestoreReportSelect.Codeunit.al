Codeunit 6188488 "ForNAV Restore Report Select."
{

    trigger OnRun()
    begin
        if not AskForConfirmation then
            exit;
        RestoreAllReportSelections;
    end;

    local procedure AskForConfirmation(): Boolean
    var
        ConfirmReplaceQst: label 'Do you want to restore all report selections to their original values?';
    begin
        exit(Confirm(ConfirmReplaceQst));
    end;

    local procedure RestoreAllReportSelections()
    var
        ReportSelectionHist: Record "ForNAV Report Selection Hist.";
    begin
        if ReportSelectionHist.FindSet then
            repeat
                ReportSelectionHist.Restore;
            until ReportSelectionHist.Next = 0;
    end;
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
