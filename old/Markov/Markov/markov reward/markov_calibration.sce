active_buttons = 6;
button_codes = 1,2,3,4,5,88;
default_stimulus_time_in = 100;
default_stimulus_time_out = 2000;
response_logging = log_active; #changed from log_all 12/1/10
response_matching = simple_matching; #added 12/1/10
default_font_size = 60;
default_text_align = align_center;
default_text_color = 0,0,0;#black
default_background_color = 231,230,230;#grey
write_codes = true;
pulse_width = 10;
response_port_output = false;

begin;


trial {            #wait for trigger.
   trial_duration = forever;
   trial_type = specific_response;    	
   terminator_button = 6;
	picture {text { caption = "please wait..."; font_size = 30;};
   x = 0; y = 0;} wait;
   time = 0;
   code = "scannerstart";
}WaitTrial;

#instructions page 1
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "calibration_instructions.jpg";};
        x = 0;  y = 0;
		  } instructions;
   code = "instructions";
   response_active = true;
}instruction_trial_1;

trial {            
   trial_duration = forever;
   trial_type = specific_response;    	
   terminator_button = 6;
	picture {text { caption = "all finished!"; font_size = 30;};
   x = 0; y = 0;} end;
}trialfinished;

picture {
	background_color = 231,230,230;
   #bitmap { filename = "cross_g.jpg";};  
	#x = 0; y = 0;
} fixation_grey;

trial {
	trial_duration = 1000;
	picture fixation_grey;
	code = "fixation grey";
	response_active = false;#added 12/1/10
	
} fixation_grey_trial;

trial {
	trial_duration = forever;
   trial_type = specific_response;    	
   terminator_button = 1,2;
	picture {text { caption = "wait for experimenter to send stimulation"; font_size = 30;};
   x = 0; y = 0;};
   time = 0;
   code = "experimenter_send_shock";
} experimenter_send_shock;

trial {
	trial_duration = 500;
	picture {text { caption = "stimulation selected"; font_size = 30;};
   x = 0; y = 0;};
   time = 0;
	code = "experiment_shock";
	port_code = 255;
} experimenter_shock;

trial {
	trial_duration = forever;
	trial_type = specific_response;    	
   terminator_button = 3,4,5;
	picture { background_color = 231,230,230;
		text { caption = "How unpleasant is the stimulation? (0 - 10)"; font_size = 30;};
			x = 0; y = 210;
		text { caption = " "; font_size = 35;} expect_amount; 
			x = 0; y = -210;
		bitmap { filename = ""; preload = false; } selection;
		   x = -90; y = -210;};
	code = "stimulation";
	response_active = true;#added 12/1/10
} stimulation_trial;


begin_pcl;

string sub_id = logfile.subject();
output_file calibration_day1 = new output_file;
calibration_day1.open("calibration_day1_"+sub_id+".txt", file_append, false);

int expect;
int expect_decision_certain;
double expectation_amount;
string expectation_amount_text;
int before_response_counter;
int sub_loop = 1;

sub expect_rating begin;

	selection.set_filename("grey.jpg");
	selection.load();
	expectation_amount=5.00;
	expectation_amount_text=string(expectation_amount);
	
## Rating page	
	before_response_counter=response_manager.total_response_count();
	loop int test = 1 until test > 100#until invest_decision_certain == 2
		begin;
		expectation_amount_text=string(expectation_amount);
		expect_amount.set_caption(""+expectation_amount_text);
		expect_amount.redraw();
		stimulation_trial.present();
		if response_manager.total_response_count() > before_response_counter then
			expect_decision_certain=response_manager.last_response();
			if expect_decision_certain==4 then
				expectation_amount=expectation_amount+1.00;
				if expectation_amount > 10.00 then
					expectation_amount = 10.00;
				end;
			elseif expect_decision_certain==5 then
				expectation_amount=expectation_amount-1.00;
				if expectation_amount < 0.00 then
					expectation_amount=0.00;
				end;
			elseif expect_decision_certain==3 then	
					selection.set_filename("arrow.jpg");
					selection.load();
					stimulation_trial.set_duration(random(1000,2500));
					stimulation_trial.present();			
					break;
			elseif expect_decision_certain==1 then				
				expectation_amount=expectation_amount+0.00;
			end;
		end;

	end;
	calibration_day1.print(expectation_amount);
	calibration_day1.print("\n");	
	
	
end;

instruction_trial_1.present();
WaitTrial.present();
int shock_loop = 0;
int experimenter_decision;

loop until shock_loop >= 1
	begin;
	before_response_counter=response_manager.total_response_count();
	experimenter_send_shock.present();
	if response_manager.total_response_count() > before_response_counter then
		experimenter_decision=response_manager.last_response();
		if experimenter_decision==1 then
			experimenter_shock.present();
		elseif experimenter_decision==2 then
			shock_loop=shock_loop+1;
		end;
	end;
	
end;

expect_rating();


fixation_grey_trial.set_duration(2000);
fixation_grey_trial.present();
trialfinished.present();

