dotnet // --> Reports ForNAV Autogenerated code - do not delete or modify
{	
	assembly("ForNav.Reports.6.0.0.2078")
	{
		type(ForNav.Report_6_0_0_2078; ForNavReport6188677_v6_0_0_2078){}   
	}
} // Reports ForNAV Autogenerated code - do not delete or modify -->

Report 6188677 "ForNAV Trial Balance"
{
	Caption = 'Trial Balance';
	RDLCLayout = './Layouts/ForNAV Trial Balance.rdlc'; DefaultLayout = RDLC;

	dataset
	{
		dataitem(Args;"ForNAV Trial Balance Args.")
		{
			DataItemTableView = sorting("Show by");
			UseTemporary = true;
			column(ReportForNavId_1000000001; 1000000001) {} // Autogenerated by ForNav - Do not delete
			dataitem("G/L Account";"G/L Account")
			{
				DataItemTableView = sorting("No.");
				PrintOnlyIfDetail = true;
				RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter", "Budget Filter";
				column(ReportForNavId_6710; 6710) {} // Autogenerated by ForNav - Do not delete
				trigger OnPreDataItem();
				begin
				end;
				
				trigger OnAfterGetRecord();
				begin
					TrialBalance.CreateForGLAccount("G/L Account", Args);
				end;
				
			}
			dataitem(TrialBalance;"ForNAV Trial Balance")
			{
				DataItemTableView = sorting("G/L Account No.");
				UseTemporary = true;
				column(ReportForNavId_1000000002; 1000000002) {} // Autogenerated by ForNav - Do not delete
				trigger OnPreDataItem();
				begin
				end;
				
			}
			trigger OnPreDataItem();
			begin
				Insert;
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
					field(ShowComaprison; Args."Show by")
					{
						ApplicationArea = Basic, Suite;
						Caption = 'Show by';
					}
					group(ColumnOption)
					{
						Caption = 'Column Option';
						field(NetChangeActual; Args."Net Change Actual")
						{
							ApplicationArea = All;
							Caption = 'Net Change Actual';
						}
						field(NetChangeActualLastYear; Args."Net Change Actual Last Year")
						{
							ApplicationArea = All;
							Caption = 'Net Change Actual Last Year';
						}
						field(Difference; Args."Variance in Changes")
						{
							ApplicationArea = All;
							Caption = 'Difference';
						}
						field(Variance; Args."% Variance in Changes")
						{
							ApplicationArea = All;
							Caption = 'Variance %';
						}
						field(BalanceatDateActual; Args."Balance at Date Actual")
						{
							ApplicationArea = All;
							Caption = 'Balance at Date Actual';
						}
						field(BalanceatDateActLastYear; Args."Balance at Date Act. Last Year")
						{
							ApplicationArea = All;
							Caption = 'Balance at Date Act. Last Year';
						}
						field(ArgsVarianceinBalances; Args."Variance in Balances")
						{
							ApplicationArea = All;
							Caption = 'Difference';
						}
						field(Control1000000007; Args."% Variance in Balances")
						{
							ApplicationArea = All;
							Caption = 'Variance %';
						}
					}
					field(RoundingFactor; Args."Rounding Factor")
					{
						ApplicationArea = All;
						Caption = 'Rounding Factor';
					}
					field(SkipAccountswithallzeroAmounts; Args."Skip Accounts with all zero")
					{
						ApplicationArea = All;
						Caption = 'Skip Accounts with all zero Amounts';
						Visible = false;
					}
					field(AllAmountsinLCY; Args."All Amounts in LCY")
					{
						ApplicationArea = All;
						Caption = 'All Amounts in LCY';
					}
					field(ForNavOpenDesigner; ReportForNavOpenDesigner)
					{
						ApplicationArea = All;
						Caption = 'Design';
						Visible = ReportForNavAllowDesign;
						trigger OnValidate()
						begin
							ReportForNav.LaunchDesigner(ReportForNavOpenDesigner);
							CurrReport.RequestOptionsPage.Close();
						end;
					}
				}
			}
		}

		actions
		{
		}

		trigger OnOpenPage()
		begin
			ReportForNavOpenDesigner := false;
			if Args.GetNoOfColumns = 0 then begin
				Args."Net Change Actual" := true;
				Args."Net Change Actual Last Year" := true;
			end;
			Args."All Amounts in LCY" := true;
		end;
	}

	trigger OnInitReport()
	begin
		;ReportsForNavInit;
		Codeunit.Run(Codeunit::"ForNAV First Time Setup");
		Commit;
		LoadWatermark;
	end;

	trigger OnPostReport()
	begin

		;ReportForNav.Post;

	end;

	trigger OnPreReport()
	begin
		Args."From Date" := "G/L Account".GetRangeMin("Date Filter");
		Args."To Date" := "G/L Account".GetRangemax("Date Filter");
		"G/L Account".SetRange("Date Filter");

		;

		;ReportsForNavPre;

	end;

	procedure SetArgs(Value: Record "ForNAV Trial Balance Args.")
	begin
		Args := Value;
	end;

	local procedure LoadWatermark()
	var
		ForNAVSetup: Record "ForNAV Setup";
		OutStream: OutStream;
	begin
		ForNAVSetup.Get;
		ForNAVSetup.CalcFields(ForNAVSetup."List Report Watermark");
		if not ForNAVSetup."List Report Watermark".Hasvalue then
			exit;

		ForNavSetup."List Report Watermark".CreateOutstream(OutStream); ReportForNav.Watermark.Image.Load(OutStream);

	end;

	// --> Reports ForNAV Autogenerated code - do not delete or modify
	var 
		[WithEvents]
		ReportForNav : DotNet ForNavReport6188677_v6_0_0_2078;
		ReportForNavOpenDesigner : Boolean;
		[InDataSet]
		ReportForNavAllowDesign : Boolean;

	local procedure ReportsForNavInit();
	var
		addInFileName : Text;
		tempAddInFileName : Text;
		path: DotNet Path;
		ApplicationSystemConstants: Codeunit "Application System Constants";
	begin
		addInFileName := ApplicationPath() + 'Add-ins\ReportsForNAV_6_0_0_2078\ForNav.Reports.6.0.0.2078.dll';
		if not File.Exists(addInFileName) then begin
			tempAddInFileName := path.GetTempPath() + '\Microsoft Dynamics NAV\Add-Ins\' + ApplicationSystemConstants.PlatformFileVersion() + '\ForNav.Reports.6.0.0.2078.dll';
			if not File.Exists(tempAddInFileName) then
				Error('Please install the ForNAV DLL version 6.0.0.2078 in your service tier Add-ins folder under the file name "%1"\\If you already have the ForNAV DLL on the server, you should move it to this folder and rename it to match this file name.', addInFileName);
		end;
		ReportForNav:= ReportForNav.Report_6_0_0_2078(CurrReport.ObjectId(), CurrReport.Language(), SerialNumber(), UserId(), CompanyName());
		ReportForNav.Init();
	end;

	local procedure ReportsForNavPre();
	begin
		ReportForNav.OpenDesigner:=ReportForNavOpenDesigner;
		if not ReportForNav.Pre() then CurrReport.Quit();
	end;

	// Reports ForNAV Autogenerated code - do not delete or modify -->
}