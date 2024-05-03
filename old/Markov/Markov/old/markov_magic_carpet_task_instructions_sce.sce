active_buttons = 3;
button_codes = 1,2,88;
#default_stimulus_time_in = 100;
#default_stimulus_time_out = 2000;
scenario_type = fMRI_emulation;
scan_period = 2000;
pulses_per_scan = 37;
response_logging = log_active; #changed from log_all 12/1/10
response_matching = simple_matching; #added 12/1/10
default_font_size = 40;
default_text_align = align_center;
default_text_color = 255,255,255;
write_codes = true;
pulse_code=99;
pulse_width = 10;
response_port_output = false;

begin;


trial {            #wait for trigger.
   trial_duration = forever;
   trial_type = specific_response;    	
   terminator_button = 3;
	picture {text { caption = "Please wait for task to start..."; font_size = 40;};
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
  		  bitmap { filename = "markov_magic_carpet_task_instructions_1.png";};
        x = 0;  y = 0;
		  } instructions;
   code = "instructions_1";
   response_active = true;
}instruction_trial_1;

#instructions page 2
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_2.png";};
        x = 0;  y = 0;
		  } instructions_2;
   code = "instructions_2";
   response_active = true;
}instruction_trial_2;

#instructions page 3
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_3.png";};
        x = 0;  y = 0;
		  } instructions_3;
   code = "instructions_3";
   response_active = true;
}instruction_trial_3;

#instructions page 4
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_4.png";};
        x = 0;  y = 0;
		  } instructions_4;
   code = "instructions_4";
   response_active = true;
}instruction_trial_4;

#instructions page 5
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_5.png";};
        x = 0;  y = 0;
		  } instructions_5;
   code = "instructions_5";
   response_active = true;
}instruction_trial_5;

#instructions page 6
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_6.png";};
        x = 0;  y = 0;
		  } instructions_6;
   code = "instructions_6";
   response_active = true;
}instruction_trial_6;

#instructions page 7
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_7.png";};
        x = 0;  y = 0;
		  } instructions_7;
   code = "instructions_7";
   response_active = true;
}instruction_trial_7;

#instructions page 8
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_8.png";};
        x = 0;  y = 0;
		  } instructions_8;
   code = "instructions_8";
   response_active = true;
}instruction_trial_8;

#instructions page 9
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_9.png";};
        x = 0;  y = 0;
		  } instructions_9;
   code = "instructions_9";
   response_active = true;
}instruction_trial_9;

#instructions page 10
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_10.png";};
        x = 0;  y = 0;
		  } instructions_10;
   code = "instructions_10";
   response_active = true;
}instruction_trial_10;

#instructions page 11
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_11.png";};
        x = 0;  y = 0;
		  } instructions_11;
   code = "instructions_11";
   response_active = true;
}instruction_trial_11;

#instructions page 12
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_12.png";};
        x = 0;  y = 0;
		  } instructions_12;
   code = "instructions_12";
   response_active = true;
}instruction_trial_12;

#instructions page 13
trial {    
	trial_duration = forever;
   trial_type = specific_response; 
	terminator_button = 3;              
   picture { 
  		  bitmap { filename = "markov_magic_carpet_task_instructions_13.png";};
        x = 0;  y = 0;
		  } instructions_13;
   code = "instructions_13";
   response_active = true;
}instruction_trial_13;

trial {            
   trial_duration = forever;
   trial_type = specific_response;    	
   terminator_button = 3;
	picture {text { caption = "End of Instructions!"; font_size = 40;};
   x = 0; y = 0;} end;
}trialfinished;

picture {
  text { caption = "+"; font_size = 40;}; 
	x = 0; y = 0;
} fixation;

trial {
	trial_duration = 2000;##change 8000
	picture fixation;
	code = "first fixation and BIOPAC trigger";
	response_active = false;#added 12/1/10
	port_code = 1;
	#mri_pulse = 1;
} fixation_and_BIOPAC_trial;

begin_pcl;

int ready_decision;
	
instruction_trial_1.present();
instruction_trial_2.present();
instruction_trial_3.present();
instruction_trial_4.present();
instruction_trial_5.present();
instruction_trial_6.present();
instruction_trial_7.present();
instruction_trial_8.present();
instruction_trial_9.present();
instruction_trial_10.present();
instruction_trial_11.present();
instruction_trial_12.present();
instruction_trial_13.present();

		
trialfinished.present();
