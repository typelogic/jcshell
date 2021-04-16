```
usage: jcshell [-h|--help][--gui][-v|--verbose][-n|--norc][-x|--echo][-g|--go][-e|--edit][-t|--terminal term][-D|--define var[=value]][-R|--rc file][-d|--debug][-c|--commDetails][-f|--script file][-p|--Dpath path]arg..

Detailed list of options:
-h|--help   Print a short or long description of all options and arguments
--gui       Start a graphical user interface for entering
            options and arguments
-v|--verbose
            Run in verbose mode
-n|--norc   Do not read rc files
-x|--echo   Echo all commands
-g|--go     Keep going, do not exit on errors
-e|--edit   Enable command line editing
-t|--terminal term
            Specify either the name of a terminal or a name plus
            some terminal parameter. The parameter must be separated by
            a ':' character
            If <term> is defined as 'SCComm', the following paramters
            may be given:
            1  for PCSC reader,
            2  for TCL reader,
            3  for OEM reader,
            4  for the (Keil) simulation
               This reader may have the following sub-parameters
               /term SCComm:4:<simu-type>:<ip-addr>:<portNo>:<Debug>
               <simu-type>      =   0  TCL (old interface via MFGeneric.dll)
                                    1  P60-CONTACT_TRANS    
                                    2  P60-CONTACT_T1       
                                    3  P60-CONTACTLESS_TRANS
                                    4  P60-CONTACTLESS_L3   
                                    5  P60-CONTACTLESS_TCL  
                                    6  I2C
                                    7  SPI
                                    8  Remote
                                    This parameter is required.
               <ip-addr> =          string containing either 'localhost',
                                    an ip-address like '127.0.0.1' or the
                                    computer name.
                                    Default is 'localhost'
               <portNo> =           Number of the port to be used
                                    Default is 8080
               <Debug> =            On   Means that all timeouts are set
                                         to 'infinite' 
                                         This will cause the system not to
                                         throw exceptions even if the 
                                         server doesn't respond in time.
                                    Off  Use command timeouts
                                    Default is 'Off'
               Example: 
                  SCComm:4:6:localhost:8080:off
            5  for the I2C reader.
               This reader may have the following sub-parameters
               /term SCComm:5:<subType>:<I2C speed>:<I2C Addr (8bit)>
               <subType>  with the following possible values:
                          0  USB Bird with external power supply
                          1  USB Bird powering the target
                          2  Intel SMB (requires additional DLL)
                          default is 1
               <I2C speed> from 1 to 255, defining the communication
                          bit rate in kBit/sec
                          default is 50kBit/sec
               <I2C Addr (8bit)> I2C slave address in hex/decimal-notation
                          default is 0x90
               Example:
                 SCComm:5:0:60:0x84    to select the I2C reader with external
                 power, 60kBit/sec and I2C Slave address is 0x84
            6  for the SPI reader.
               This reader may have the following sub-parameters
               /term SCComm:6:<SPI speed>
               <SPI speed> from 0 to 6, defining the communication
                          bit rate
                          0  500kBit/sec
                          1  1MBit/sec
                          2  2MBit/sec
                          3  5MBit/sec
                          4  8MBit/sec
                          5  10MBit/sec
                          6  12MBit/sec
                          default is 500kBit/sec
               Example:
                 SCComm:6:1    to select the SPI reader with 1MBit/sec
            
            -----------------------------------------------------------------------------
            SCR :: 
            If <term> is defined as 'SCR', the following paramters
            may be given:
            +-------------------+---------------------------+----------------------------------+
            |     interface     | DWP, SWP, SPI, SWP_SPI,   | Interface type to be used for    |
            |                   | DWP_SPI or ISO7816        | communication                    |
            +-------------------+---------------------------+----------------------------------+
            |                   |                           | Value 0 selects T=0.             |
            |     protocol      | 0, 1 or 2                 | Value 1 selects T=1              |
            |                   |                           | Value 2 uses an AUTOMATIC        |
            |                   |                           | detection.                       |
            +-------------------+---------------------------+----------------------------------+
            |                   |                           | f is a numeric float value to    |
            |     frequency     | f                         | represent the frequency in MHz   |
            |                   |                           | (e.g. 5.0 for 5 [MHz])           |
            +-------------------+---------------------------+----------------------------------+
            |                   |                           | Value 0 selects BUS.             |
            |  activation-mode  | 0, 1 or 2                 | Value 1 selects ACT              |
            |                   |                           | Value 2 selects HCI.             |
            +-------------------+---------------------------+----------------------------------+
            |power-cycle-enable | 0 or 1                    | Value 0 to disable.              |
            |                   |                           | Value 1 to enable                |
            +-------------------+---------------------------+----------------------------------+
            |    target-gate    | 0 or 1                    | Value 0 to select card-emulation.|
            |                   |                           | Value 1 to select wired-mode.    |
            +-------------------+---------------------------+----------------------------------+
            |                   |                           | wt is a integer value to set the |
            |   waiting-time    | wt                        | waiting-time in [ms].            |
            |                   |                           | Default value is 1000 [ms]       |
            +-------------------+---------------------------+----------------------------------+
            |    SWP voltage    | 1.8                       | value in V                       |
            +-------------------+---------------------------+----------------------------------+
            |   SWP frequency   | e.g. 0.5                  | value in MHz                     |
            +-------------------+---------------------------+----------------------------------+
            |   SPI bit rate    | e.g. 1000                 | value in kbps                    |
            +-------------------+---------------------------+----------------------------------+
            
            Usage ::
             /terminal SCR:<interface>:<protocol>:<frequency>:<activation-mode>:<power-cycle-enable>:<target-gate>:<waiting-time>:<voltage>:<frequency>:<SPI bit rate>
            
            ISO7816 ::
                Usage :: 
                /terminal SCR:ISO7816:<protocol>:<waiting-time>:<voltage>:<frequency>:<SCR log Option>
                    Example : 
                        SCR:ISO7816:2:180000:1.8:3.0
            DWP ::
                Usage :: 
                /terminal SCR:DWP:<protocol>:<frequency>:<activation-mode>:<power-cycle-enable>:<target-gate>:<waiting-time>:<voltage>:<frequency>:<SCR log Option>
                    Example : 
                        SCR:DWP:2:5.0:2:0:1:180000:1.8:0.5
            SWP ::
                Usage :: 
                /terminal SCR:SWP:<protocol>:<frequency>:<activation-mode>:<power-cycle-enable>:<target-gate>:<waiting-time>:<voltage>:<frequency>:<SCR log Option>
                    Example : 
                        SCR:SWP:2:5.0:2:0:1:180000:1.8:0.5
            SPI ::
                Usage :: 
                /terminal SCR:SPI:<protocol>:<SPI bit rate>:<voltage>:<frequency>:<SCR log Option>
                    Example : 
                        SCR:SPI:2:1000.0:1.8:0.5
            SWP_SPI ::
                Usage :: 
                /terminal SCR:SWP_SPI:<protocol>:<frequency>:<activation-mode>:<power-cycle-enable>:<target-gate>:<waiting-time>:<voltage>:<frequency>:<SPI bit rate>:<SCR log Option>
                    Example : 
                        SCR:SWP_SPI:2:5.0:2:0:1:180000:1.8:0.5:1000.0
            DWP_SPI ::
                Usage :: 
                /terminal SCR:DWP_SPI:<protocol>:<frequency>:<activation-mode>:<power-cycle-enable>:<target-gate>:<waiting-time>::<voltage>:<frequency>:<SPI bit rate>:<SCR log Option>
                    Example : 
                        SCR:DWP_SPI:2:5.0:2:0:1:180000:1.8:0.5:1000.0
            
            
            I2C ::
                Usage :: 
                /terminal SCR:I2C:<protocol>:<frequency>:<bit rate>:<voltage>:<frequency>:<control byte>:<waiting-time>:<SCR log Option>:<IO mode Option>:<reset mode option>:<clock mode option>
                    Example : 
                        SCR:I2C:0:100:3.0:1.0:0x20:1000:1:8:1:3
             NOTE: <IO mode Option>, <reset mode option>, <clock mode option> are optional inputs. By default IO Mode = 8, reset mode = 1 and clock mode = 3 for raw I2C communication on SCR reader. 
            
            SCI2C ::
                Usage :: 
                /terminal SCR:SCI2C:<protocol>:<frequency>:<bit rate>:<voltage>:<frequency>:<power_cycle>:<waiting-time>:<SCR log Option>:<IO mode Option>:<reset mode option>:<clock mode option>
                    Example : 
                        SCR:I2C:0:100:3.0:1.0:0:1000:1:8:1:3
             NOTE: <IO mode Option>, <reset mode option>, <clock mode option> are optional inputs. By default IO Mode = 3, reset mode = 1 and clock mode = 3 for SC I2C communication on SCR reader. 
            
            If <term> is defined as 'Micro Pross Reader', the following paramters
            may be given:
             1. For MP300 readers: 
                  Usage :: 
                    /terminal MP300:<Connection Port>:<Serial Number>:<Resource ID>:<Coupler Number>:<Card Type>:<Tx Data Rate>:<Rx Data Rate>
                   i.   <Connection Port> = USB (Default)
                   ii.  <Serial Number>   = Serial number of Micro Pross Reader
                   iii. <Resource ID>     = 122 
                   iv.  <Coupler ID>      = 1 
                   v.   <Card Type> 
                               Card Type A             = 1 
                              Card Type B             = 2 
                              Card Type TYPE_MIFARE   = 3 
                              Card Type TYPE_VICINITY = 4 
                              Card Type TYPE_FELICA   = 5 
                   vi.  <Tx Data Rate> : Transmission Data Rate 
                        +--------------------------------+--------------+
                        |     Transmission Data Rate     | Value        |
                        +-------+------------------------+--------------+
                        |       TX_106KB                 |    106       |
                        |       TX_212KB                 |    212       |
                        |       TX_424KB                 |    424       |
                        |       TX_848KB                 |    848       |
                        |       TX_1695KB                |    1695      |
                        |       TX_3390KB                |    3390      |
                        |       TX_6780KB                |    6780      |
                        +--------------------------------+--------------+
                   vii. <Rx Data Rate> : Receving Data Rate 
                        +--------------------------------+--------------+
                        |     Rece Data Rate     | Value        |
                        +-------+------------------------+--------------+
                        |       RX_106KB                 |    106       |
                        |       RX_212KB                 |    212       |
                        |       RX_424KB                 |    424       |
                        |       RX_848KB                 |    848       |
                        |       RX_1695KB                |    1695      |
                        |       RX_3390KB                |    3390      |
                        |       RX_6780KB                |    6780      |
                        +--------------------------------+--------------+
                                                                         
                   NOTE:  For Card Type A and B supported Tx_Data Rate and RX Data Rate are 106KB/212KB/424KB/848KB.
                    By Default Tx and Rx Data Rate are set to 106KB. 
                    Example: /term MP300:USB:9050:122:1:1 
             
             2. For MP500 readers: 
                  Usage :: 
                    /terminal MP500:<Connection Port>:<Serial Number>:<Resource ID>:<Coupler Number>:<Card Type>:<Tx Data Rate>:<Rx Data Rate>
                   i.   <Connection Port> = USB (Default)
                   ii.  <Serial Number>   = Serial number of Micro Pross Reader
                   iii. <Resource ID>     = 246 
                   iv.  <Coupler ID>      = 0 
                   v.   <Card Type> 
                               Card Type A             = 1 
                              Card Type B             = 2 
                              Card Type TYPE_MIFARE   = 3 
                              Card Type TYPE_VICINITY = 4 
                              Card Type TYPE_FELICA   = 5 
                   vi.  <Tx Data Rate> : Transmission Data Rate 
                        +--------------------------------+--------------+
                        |     Transmission Data Rate     | Value        |
                        +-------+------------------------+--------------+
                        |       TX_106KB                 |    106       |
                        |       TX_212KB                 |    212       |
                        |       TX_424KB                 |    424       |
                        |       TX_848KB                 |    848       |
                        |       TX_1695KB                |    1695      |
                        |       TX_3390KB                |    3390      |
                        |       TX_6780KB                |    6780      |
                        +--------------------------------+--------------+
                   vii. <Rx Data Rate> : Receving Data Rate 
                        +--------------------------------+--------------+
                        |     Rece Data Rate     | Value        |
                        +-------+------------------------+--------------+
                        |       RX_106KB                 |    106       |
                        |       RX_212KB                 |    212       |
                        |       RX_424KB                 |    424       |
                        |       RX_848KB                 |    848       |
                        |       RX_1695KB                |    1695      |
                        |       RX_3390KB                |    3390      |
                        |       RX_6780KB                |    6780      |
                        +--------------------------------+--------------+
                                                                         
                   NOTE:  For Card Type A and B supported Tx_Data Rate and RX Data Rate are 106KB/212KB/424KB/848KB.
                    By Default Tx and Rx Data Rate are set to 106KB. 
                    Example: /term MP500:USB:9050:246:0:1 
             
             3. For MP65 reader: 
                  Usage :: 
                    /terminal MP65:<Protocol>:<Voltage>:<Frequency>:<Connection Port>:<Serial Number>
                   i.   <Protocol>        = SWP         (Default)
                   ii.  <Voltage>         = 1800mV      (Default)
                   iii. <Frequency>       = 5000000MHz  (Default)
                   iv.  <Connection Port> = USB         (Default)
                   v.   <Serial Number>   = Serial number of Micro Pross Reader
                   NOTE: Protocol supported for MP65 reader are : SWP and ISO7816 
                   Example: /term MP65:SWP:3.0:5000000:USB:MCQ.05.27.18 
             
            
            Remote :: 
            If <term> is defined as 'Remote', the following parameters
            can be given:
            a. PC Simulator
            Usage ::
                      /term Remote|[<protocol>]:<address>:<portC>:[<portCL>]
                       <protocol>: Type of protocol supported by Remote Terminal:
                                   +---------------+-----------------------------------------------------+
                                   |     VALUE     |        DESCRIPTION                                  |
                                   +---------------+-----------------------------------------------------+
                                   |    T0         |  T=0 byte oriented transmission protocol            |
                                   |    T0_TPDU    |  T=0 protocol , dislays only SW1SW2,                |
                                   |               |  does not send GET RESPONSE command automatically   |
                                   |    T1         |  T=1 block oriented transmission protocol           |
                                   |    SWPDWP     |  SWP/DWP protocol                                   |
                                   +---------------+-----------------------------------------------------+
                       <address>:  string containing either 'localhost',an ip-address like '127.0.0.1' or the
                                   computer name.
                       <portC>  :  Number of the port to be used for contact based interface
                                   Default is 8050
                       <portCL> :  Number of the port to be used for contactless based interface
            NOTE :: SWPDWP protocol would be supported in future. Current behavior would be same as like T=1 protocol.
            EXAMPLE :: /term Remote|T0:localhost:8050
                       /term Remote|T0_TPDU:localhost:8050
                       /term Remote|T1
            b. PCSC Reader over TCP interface
            Usage ::
                      /term Remote|[<protocol>]:<PCSC[|reader name]>:[port]:[log option]
                       <protocol>          : Type of protocol supported by Remote Terminal:
                                             +---------------+-----------------------------------------------------+
                                             |     VALUE     |        DESCRIPTION                                  |
                                             +---------------+-----------------------------------------------------+
                                             |    T0         |  T=0 byte oriented transmission protocol            |
                                             |    T1         |  T=1 block oriented transmission protocol           |
                                             +---------------+-----------------------------------------------------+
                       <PCSC[|reader name]>: string starting with 'PCSC' followed by '|' and reader name
                                             reader name is optional, if reader name not provided, 
                                             JCShell checks for all connected PCSC readers for card present.
                                             if card is not present on any reader, throws error.
                       <port>              : Number of the port to be used for TCP interface
                                             Default is 8060
                       <log option>        : 1 to enable logging for TCP interface, disabled otherwise
            EXAMPLE :: /term Remote|T0:"PCSC|OMNIKEY CardMan 5x21 0":8070
                       /term Remote|"PCSC|OMNIKEY CardMan 5x21 0":8060
                       /term Remote|PCSC
            
-D|--define var[=value]
            Predefine some variables
-R|--rc file
            Read this script first before executing other commands
-d|--debug  Debug mode
-c|--commDetails
            common details
-f|--script file
            The script file be executed
-p|--Dpath path
            Set path variable through argument
path        path variable value
arg         Script file parameters

IBM JavaCard shell.
```
