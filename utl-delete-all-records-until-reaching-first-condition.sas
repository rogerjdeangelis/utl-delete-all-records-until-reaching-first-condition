Delete all records until reaching first condition by group?                                                                 
                                                                                                                            
Perhaps this solution is a little more maitainable. Seems to have the same number of statements.                            
                                                                                                                            
github                                                                                                                      
https://tinyurl.com/yft6rck8                                                                                                
https://github.com/rogerjdeangelis/utl-delete-all-records-until-reaching-first-condition                                    
                                                                                                                            
SAs Forum                                                                                                                   
https://tinyurl.com/ydqw85ej                                                                                                
https://communities.sas.com/t5/SAS-Programming/Delete-all-records-until-reaching-first-condition-by-group/m-p/604647        
                                                                                                                            
Years ago I wrote a PERL lights out script to run SAS batch.                                                                
I was not a PERL guru, but the boss said he liked my code better that what he had seen from the gurus.                      
PEL is notorius for obfuscation.                                                                                            
                                                                                                                            
*_                   _                                                                                                      
(_)_ __  _ __  _   _| |_                                                                                                    
| | '_ \| '_ \| | | | __|                                                                                                   
| | | | | |_) | |_| | |_                                                                                                    
|_|_| |_| .__/ \__,_|\__|                                                                                                   
        |_|                                                                                                                 
;                                                                                                                           
                                                                                                                            
DATA HAVE;                                                                                                                  
INPUT ID DATE :$10. ACTION;                                                                                                 
cards4;                                                                                                                     
1 JAN012019 1                                                                                                               
1 FEB012019 1                                                                                                               
1 MAR012019 2                                                                                                               
2 JAN012019 2                                                                                                               
2 FEB012019 1                                                                                                               
;;;;                                                                                                                        
RUN;                                                                                                                        
                                                                                                                            
                                                                                                                            
WORK.HAVE total obs=5                                                                                                       
                             | RULES                                                                                        
  ID      DATE       ACTION  |                                                                                              
                             |                                                                                              
   1    JAN012019       1    |                                                                                              
   1    FEB012019       1    |                                                                                              
   1    MAR012019       2    | Hit the 2 output the rest of the                                                             
                               records in ID 1. There aare no more records.                                                 
                                                                                                                            
   2    JAN012019       2    | Hit the 2 output the rest of group 2                                                         
   2    FEB012019       1    |                                                                                              
                                                                                                                            
*            _               _                                                                                              
  ___  _   _| |_ _ __  _   _| |_                                                                                            
 / _ \| | | | __| '_ \| | | | __|                                                                                           
| (_) | |_| | |_| |_) | |_| | |_                                                                                            
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                           
                |_|                                                                                                         
;                                                                                                                           
                                                                                                                            
Up to 40 obs WORK.WANT total obs=3                                                                                          
                                                                                                                            
   ID      DATE       ACTION                                                                                                
                                                                                                                            
    1    MAR012019       2                                                                                                  
    2    JAN012019       2                                                                                                  
    2    FEB012019       1                                                                                                  
                                                                                                                            
*                                                                                                                           
 _ __  _ __ ___   ___ ___  ___ ___                                                                                          
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                         
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                         
| .__/|_|  \___/ \___\___||___/___/                                                                                         
|_|                                                                                                                         
;                                                                                                                           
                                                                                                                            
data want(drop=beenthere);;                                                                                                 
  retain beenthere 0;                                                                                                       
  set have;                                                                                                                 
  by id;                                                                                                                    
  if ACTION=2 and beenthere=0 then beenthere=1;                                                                             
  if beenthere then output;                                                                                                 
  if last.id then beenthere=0;                                                                                              
run;                                                                                                                        
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
                                                                                                                            
