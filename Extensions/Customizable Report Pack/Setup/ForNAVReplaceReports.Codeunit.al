Codeunit 6188487 "ForNAV Replace Reports"
{

    trigger OnRun()
    begin
    end;

    [EventSubscriber(Objecttype::Codeunit, 44, 'OnAfterSubstituteReport', '', false, false)]
    local procedure ForNAVReplaceReports(ReportId: Integer; var NewReportId: Integer)
    var
        ReportReplacement: Record "ForNAV Report Replacement";
    begin
        if ReportReplacement.Get(ReportId, UserId) then begin
            NewReportId := ReportReplacement."Replace-With Report ID";
            exit;
        end;

        if ReportReplacement.Get(ReportId) then begin
            NewReportId := ReportReplacement."Replace-With Report ID";
            exit;
        end;
    end;
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
