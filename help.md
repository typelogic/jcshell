Active commands when connected to the reader:
```
Terminal active commands:

 /applet             /get-scr-serialnum       /set-scr01-vtptrigger    
 /atr                /get-screxec-time        /set-swp-activation-time 
 /cap-clear          /get-swp-activation-time /set-swp-actsync-time    
 /cap-del-auth       /get-swp-actsync-time    /set-var                 
 /cap-extrdt-auth    /glob                    /sleep                   
 /cap-info           /identify                /start-mp300-timer       
 /cap-inst-auth      /list-readers            /start-mp500-timer       
 /cap-load-auth      /list-vars               /start-mpreader-timer    
 /cap-reg-update     /manage-channel          /start-scr-timer         
 /cap-sign           /mode                    /start-timer             
 /card               /printf                  /stop-mp300-timer        
 /change-protocol    /r-echo                  /stop-mp500-timer        
 /channel            /register                /stop-mpreader-timer     
 /clear-vars         /select                  /stop-scr-timer          
 /close              /select-scr01            /stop-timer              
 /echo               /send                    /switch-swp-gate         
 /error              /set-channel             /terminal                
 /exchange-poweroff  /set-scr01-baudrate      >                        
 /exchange-warmreset /set-scr01-icctrigger    ?                        
 /exec               /set-scr01-trigger1      help                     
 /expr               /set-scr01-trigger2      quit                     
 /get-clf-param      /set-scr01-vcc           version                  
```

Active commands when connected to the card:
```
Card active commands:

 /applet                  /start-timer                   
 /atr                     /stop-mp300-timer              
 /cap-clear               /stop-mp500-timer              
 /cap-del-auth            /stop-mpreader-timer           
 /cap-extrdt-auth         /stop-scr-timer                
 /cap-info                /stop-timer                    
 /cap-inst-auth           /switch-swp-gate               
 /cap-load-auth           /terminal                      
 /cap-reg-update          >                              
 /cap-sign                ?                              
 /card                    auth                           
 /change-protocol         card-info                      
 /channel                 delete                         
 /clear-vars              delete-key                     
 /close                   ext-auth                       
 /echo                    extradite                      
 /error                   flush                          
 /exchange-poweroff       get-cplc                       
 /exchange-warmreset      get-crs-state                  
 /exec                    get-data                       
 /expr                    get-sd-cert                    
 /get-clf-param           help                           
 /get-scr-serialnum       init-update                    
 /get-screxec-time        install                        
 /get-swp-activation-time internal-authenticate          
 /get-swp-actsync-time    ls                             
 /glob                    mutual-authenticate            
 /identify                perform-security-operation     
 /list-readers            personalize                    
 /list-vars               print-key                      
 /manage-channel          put-key                        
 /mode                    put-key-ecc                    
 /printf                  put-keyset                     
 /r-echo                  put-pub-key                    
 /register                quit                           
 /select                  registry-update                
 /select-scr01            select                         
 /send                    send                           
 /set-channel             session-info                   
 /set-scr01-baudrate      set-applet                     
 /set-scr01-icctrigger    set-crs-state                  
 /set-scr01-trigger1      set-key                        
 /set-scr01-trigger2      set-scp                        
 /set-scr01-vcc           set-sd-state                   
 /set-scr01-vtptrigger    set-security                   
 /set-swp-activation-time set-state                      
 /set-swp-actsync-time    store-aid                      
 /set-var                 store-data                     
 /sleep                   store-keyset                   
 /start-mp300-timer       upload                         
 /start-mp500-timer       upload-install-make-selectable 
 /start-mpreader-timer    version                        
 /start-scr-timer         
```
