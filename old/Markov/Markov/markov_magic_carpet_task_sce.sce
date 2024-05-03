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
	picture {text { caption = "End of Trial!"; font_size = 40;};
   x = 0; y = 0;} end;
}trialfinished;

trial {            
   trial_duration = 20000;
	picture {text { caption = "This is a 20 second rest period"; font_size = 60;};
   x = 0; y = 0;} rest;
}rest_trial;


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

bitmap { filename = "S1_L_carpet_rv.png";}S1_L_bit;
bitmap { filename = "S1_R_carpet_rv.png";}S1_R_bit;

#change these to add boxes
bitmap { filename = "S1_L_carpet_box_rv.png";}S1_L_box_bit;
bitmap { filename = "S1_R_carpet_box_rv.png";}S1_R_box_bit;

trial {
  trial_duration = 2000;
  trial_type = specific_response;
  terminator_button = 1,2;	
  picture {
  		  bitmap S1_L_bit;
        x = -410;  y = 0;
        bitmap S1_R_bit;
        x = 410;  y = 0;
		  } stage1_pic;
	 code = "stage1";
    response_active = true;#added 12/1/10
} stage1_trial;

picture {
  		  bitmap S1_L_bit;
        x = 0;  y = 250;
        bitmap S1_R_bit;
        x = 410;  y = -250;
		  } stage1_up_pic;
		
trial {
  trial_duration = 1000;
  picture stage1_up_pic;
	 code = "stage1_up";
    response_active = true;#added 12/1/10
} stage1_up_trial;

trial {
  trial_duration = 1000;
  picture stage1_pic;
	 code = "stage1_outcome";
    response_active = true;#added 12/1/10
} stage1_outcome_trial;

bitmap { filename = "S2_L_L_pink_rv.png";}S2_L_L_bit;
bitmap { filename = "S2_L_R_pink_rv.png";}S2_L_R_bit;
bitmap { filename = "S2_R_L_blue_rv.png";}S2_R_L_bit;
bitmap { filename = "S2_R_R_blue_rv.png";}S2_R_R_bit;

#change these to add boxes
bitmap { filename = "S2_L_L_box_pink_rv.png";}S2_L_L_box_bit;
bitmap { filename = "S2_L_R_box_pink_rv.png";}S2_L_R_box_bit;
bitmap { filename = "S2_R_L_box_blue_rv.png";}S2_R_L_box_bit;
bitmap { filename = "S2_R_R_box_blue_rv.png";}S2_R_R_box_bit;

picture {
		  bitmap S1_L_bit;
		  x = 0; y = 250;
  		  bitmap S2_L_L_bit;
        x = -410;  y = -250;
        bitmap S2_L_R_bit;
        x = 410;  y = -250;
		  } stage2_pic;
				
picture {
		  bitmap S1_L_bit;
		  x = 0; y = 250;
  		  bitmap S2_L_L_bit;
        x = -410;  y = -250;
		  } stage2_up_pic;		
		
picture {
		  bitmap S1_L_bit;
		  x = 0; y = 250;
  		  bitmap S2_L_L_bit;
        x = 0;  y = -250;
		  } stage2_outcome_pic;		

trial {
  trial_duration = 2000;
  trial_type = specific_response;
  terminator_button = 1,2;	
  picture stage2_pic;  
	 code = "stage2";
    response_active = true;#added 12/1/10
} stage2_trial;

trial {
  trial_duration = 1500;	
  picture stage2_outcome_pic;  
	 code = "stage2_outcome";
    response_active = true;#added 12/1/10
} stage2_outcome_trial;

trial {
  trial_duration = 1000;	
  picture stage2_up_pic;  
	 code = "stage2_up";
    response_active = true;#added 12/1/10
} stage2_up_trial;


bitmap { filename = "genie_coin.png";}coin_win_bit;
bitmap { filename = "genie_zero.png";}coin_no_win_bit;

trial {
	picture fixation;
	code = "fixation";
	response_active = false;
} fixationTrial;

trial {
	trial_duration = 3000;
	picture fixation;
	code = "endtrial";
	response_active = false;
} fixationTrial1;

text { caption = "temp"; } text1;
text { caption = "temp"; } text2;
text { caption = "temp"; } text3;
text { caption = "temp"; } text4;

trial {
   trial_duration = 1000;
   picture {
      text text1;
		x = 0; y = 250;
		text text2;
		x = 0; y = 150;
		text text3;
		x = 0; y = 50;
		text text4;
		x = 0; y = -50;
   } text_pic;
} text_trial;



begin_pcl;

int ready_decision;

double stage_1_L_probs = 0.70;
double stage_1_R_probs=0.30;
int stage1_outcome;
double stage1_random;
double stage2_random;
double trial_probs;
bitmap stage1_up_choice;
bitmap stage2_coin_pic;
bitmap stage2_up_choice;
bitmap stage2_other_choice;
int stage2_other_pic_x;
int box_index; int other_box_index;

double new_prob;

array <double> prob_array[4];
prob_array = {0.3,0.70,0.70,0.30};

sub stage1 begin;
	
	#set each pic to defaults
	stage1_pic.set_part(1, S1_L_bit);
	stage1_pic.set_part(2, S1_R_bit);
	stage1_pic.set_part_y(1,0);stage1_pic.set_part_x(1,-410);
	stage1_pic.set_part_y(2,0);stage1_pic.set_part_x(2,410);
	stage1_trial.get_stimulus_event(1).set_event_code("stage1");
	stage1_trial.set_duration(forever);
	
	#start each trial with fixation
	#fixationTrial.set_duration(random(750,750));
	#fixationTrial.present();
	
	#present the stage 1
	stage1_trial.present();
	
	#get participant response
	ready_decision = response_manager.last_response();
	
	#determine random variable to determine stage 2
	stage1_random=random();
	
	#if chose left option
	if ready_decision == 1 then
		stage1_up_choice = S1_L_box_bit;
		trial_probs = stage_1_L_probs;#set probability for this trial      
	#if chose right option
	elseif ready_decision == 2 then
		stage1_up_choice = S1_R_box_bit;
		trial_probs = stage_1_R_probs;#set probability for this trial		
	end;
	stage1_pic.set_part(ready_decision,stage1_up_choice);#put box around chosen option
	stage1_trial.set_duration(random(750,750));#present with box around chosen option
	stage1_trial.get_stimulus_event(1).set_event_code("stage1_box");#change event code	
	stage1_trial.present();#present with box around chosen option
	stage1_pic.set_part_x(ready_decision,0);#change x coordinate of chosen option
	stage1_pic.set_part_y(ready_decision,250);#change y coordinate of chosen option
	stage1_outcome_trial.set_duration(random(10,10));
	stage1_outcome_trial.present();#present with chose option up
		
	stage2_pic.set_part(1, stage1_up_choice);#set the chosen picture as the picture to move up for stage 2
	
   #determine the outcome of stage 1
	if stage1_random < trial_probs then
		stage1_outcome=1;#go to left stage 2
	else
		stage1_outcome=2;#go to right stage 2
	end;
	
end;

sub stage2 begin;	

	#set stage 2 pic parts to defaults
	stage2_trial.set_duration(forever);
	
	if stage1_outcome == 1 then #go to left stage 2
		#set up 
		stage2_pic.set_part(2,S2_L_L_bit);
		stage2_pic.set_part(3,S2_L_R_bit);
		stage2_trial.get_stimulus_event(1).set_event_code("stage2A");
	elseif stage1_outcome == 2 then #go to right stage 2
		#set up 
		stage2_pic.set_part(2,S2_R_L_bit);
		stage2_pic.set_part(3,S2_R_R_bit);
		stage2_trial.get_stimulus_event(1).set_event_code("stage2B");
	end;
	stage2_trial.present();
		
	#get participant response
	ready_decision = response_manager.last_response();
	
	#determine random variable to determine stage 2
	stage2_random=random();	
	
	#if chose left option
	if ready_decision == 1 then
		if stage1_outcome == 1 then
			stage2_up_choice = S2_L_L_box_bit;
			stage2_other_choice = S2_L_R_bit;
			trial_probs = prob_array[1];#set probability
		elseif stage1_outcome == 2 then
			stage2_up_choice = S2_R_L_box_bit;
			stage2_other_choice = S2_R_R_bit;
			trial_probs = prob_array[3];#set probability
		end;
		stage2_other_pic_x = 2000; #changed from '500' in order to prevent other stage 2 choice from appearing on the screen - KC 8/2020
		box_index = 2; other_box_index = 3;		
	#if chose right option	
	elseif ready_decision == 2 then
		if stage1_outcome == 1 then
			stage2_up_choice = S2_L_R_box_bit;
			stage2_other_choice = S2_L_L_bit;
			trial_probs = prob_array[2];#set probability
		elseif stage1_outcome == 2 then
			stage2_up_choice = S2_R_R_box_bit;
			stage2_other_choice = S2_R_L_bit;
			trial_probs = prob_array[4];#set probability
		end;
		stage2_other_pic_x = -2000;#changed from '-500' in order to prevent other stage 2 choice from appearing on the screen - KC 8/2020
		box_index = 3; other_box_index = 2;
	end;
	stage2_pic.set_part(box_index,stage2_up_choice);#put box around chosen option
	stage2_pic.set_part(other_box_index,stage2_other_choice);
	stage2_trial.get_stimulus_event(1).set_event_code("stage2_box");#change event code	
	stage2_trial.set_duration(random(750,750));#put box around chosen option
	stage2_trial.present();#put box around chosen option
	#move chosen option up
	stage2_up_pic.set_part(1,stage2_up_choice);
	stage2_up_pic.set_part_x(1,0);stage2_up_pic.set_part_y(1,250);
	stage2_up_pic.set_part(2,stage2_other_choice);
	stage2_up_pic.set_part_x(2,stage2_other_pic_x);stage2_up_pic.set_part_y(2,0);
	stage2_up_trial.set_duration(random(750,750));
	stage2_up_trial.present();#move chose option up
	
   #determine the outcome of stage 2
	if stage2_random < trial_probs then
		stage2_coin_pic = coin_win_bit;
		stage2_outcome_trial.get_stimulus_event(1).set_event_code("stage2_win");
	else
		stage2_coin_pic = coin_no_win_bit;
		stage2_outcome_trial.get_stimulus_event(1).set_event_code("stage2_lose");
	end;
	

	stage2_outcome_pic.set_part(1, stage2_up_choice);
	stage2_outcome_pic.set_part(2, stage2_coin_pic);

	
	stage2_outcome_trial.set_duration(random(1000,1000));
	stage2_outcome_trial.present();
end;



double a;
double b;

string sub_id = logfile.subject();
output_file prob_arrays = new output_file;
prob_arrays.open("reward_prob_arrays_"+sub_id+".txt", file_append, false);


sub random_walk begin;

	#loop through each element of the array
	loop int r_loop = 1 until r_loop > 4
	begin;
		
		#print out probs on each trial to check
		prob_arrays.print(prob_array[r_loop]);
		#make space delimited
		prob_arrays.print(" ");
		
		#first generate normally distributed random variable
		a = random(); #the first of two required uniform rvs between 0 and 1
		b = random(); #the other required uniform rv between 0 and 1
		#this is now a random number from a normal distribution
		double rnorm = cos(double(2)*pi_value*a) * sqrt(double(-2)*log(b)); #desired rv
		
		#scale rnorm by desired standard deviation
		rnorm = rnorm *0.025;
		
		#add rnorm to old probability; this is how the probability randomly walks
      new_prob = prob_array[r_loop]+rnorm;
		
		#restrict prob to ceiling and floor of .75 .25
		if new_prob > 0.75 then
			new_prob = 0.75;
		elseif new_prob < 0.25 then
			new_prob = 0.25;
		end;
		
		#update prob_array with new probability
	   prob_array.fill(r_loop,r_loop,new_prob,0);
		
		#update loop
		r_loop = r_loop+1;
				
	end;
	
	#go to new line
	prob_arrays.print("\n");
	
	#this code was for checking if the random walk was working
	#text1.set_caption(string(prob_array[1]));
	#text1.redraw();
	#text_pic.set_part(1,text1);
	#text2.set_caption(string(prob_array[2]));
	#text2.redraw();
	#text_pic.set_part(2,text2);
	#text3.set_caption(string(prob_array[3]));
	#text3.redraw();
	#text_pic.set_part(3,text3);
	#text4.set_caption(string(prob_array[4]));
	#text4.redraw();
	#text_pic.set_part(4,text4);
	#text_trial.present();
	
	
	
end;
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
fixationTrial.set_duration(random(500,500));
fixationTrial.present();

loop int trial_loop = 1 until trial_loop > 201
begin;
		
	stage1();
	stage2();
	random_walk();
	
	trial_loop=trial_loop+1
end;
		
trialfinished.present();
