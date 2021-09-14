Report 6188660 "ForNAV Sales Item Price Tag"
{
    Caption = 'Item Price Tag';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Args; "ForNAV Label Args.")
        {
            DataItemTableView = sorting("Report ID");
            UseTemporary = true;
            column(ReportForNavId_2; 2)
            {
            }
        }
        dataitem(Label; Item)
        {
            RequestFilterFields = "No.", "Statistics Group", "Vendor No.";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PrintLabel;
            end;

            trigger OnPreDataItem()
            begin
                ShowLabelWarning;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Orientation; Args.Orientation)
                    {
                        ApplicationArea = All;
                        Caption = 'Orientation';
                    }
                    field(OneLabelPerPackage; Args."One Label per Package")
                    {
                        ApplicationArea = All;
                        Caption = 'One Label per Package';
                    }
                    field(ForNavOpenDesigner; Args."Open Designer")
                    {
                        ApplicationArea = All;
                        Caption = 'Design';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        Codeunit.Run(Codeunit::"ForNAV First Time Setup");
        Commit;
    end;

    local procedure PrintLabel()
    var
        CreateLabel: Codeunit "ForNAV Label Mgt.";
    begin
        Args."Report ID" := Report::"ForNAV Label Price Tag";
        Args.CreateLabels(Label);
    end;

    local procedure ShowLabelWarning()
    var
        LabelWarning: Codeunit "ForNAV Label Warning";
    begin
        LabelWarning.ShowLabelWarning(Label.Count);
    end;
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
