tableextension 56789 TableExtension56789 extends Customer
{
	fields
	{
		field(56789; Rating; Option)
		{
			DataClassification = EndUserIdentifiableInformation;
			OptionMembers = Bronce,Silver,Gold;
		}
	}
}

pageextension 56789 "PageExtension56789" extends "Customer Card"
{
	layout
	{
		addafter(Name)
		{
				field(Rating; Rec.Rating) { ApplicationArea = All;}
		}
	}
	actions
	{

		addlast(Reporting)
		{
			action("ForNAV 50000")
			{
				Caption = 'ForNAV 50000';
				Image = "PrintCover";
				Promoted = False;
				
				ApplicationArea = All;
				trigger OnAction() 
				var
					reportRec: Record "Customer";
				begin
					reportRec := Rec; reportRec.SetRecFilter();
					Report.Run(Report::"ForNAV 50000", true, false, reportRec);
				end;
			}
		}
	
	}
}
