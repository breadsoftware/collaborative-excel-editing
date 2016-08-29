# collaborative-excel-editing
Bread Sheets - Online Collaborative Excel Spreadsheet Editor http://www.breadsoftware.com

Bread Sheets is an online collaborative excel spreadsheet editor that allows several users to work on the same worksheets in real time. Users can be anywhere in world, but using Bread Sheets they can all work real time on same workbook and interact with each other. Everybody's changes are instantly reflected and changes are saved back to server.

Get started with Bread Sheets - online collaborative excel spreadsheet editor by just using your browser. Your spreadsheets can be accessed directly in browser and there is no need to install any plugins or activex controls. Your spreahsheets can be accessed from anywhere, using any device, on the go.

To get started, there are 2 files included in the installation - embeddocs.html and embedsheets.html, located at C:\Program Files\Bread\Samples\GettingStarted or /usr/local/Bread/Samples/GettingStarted
Bread internally uses Node as a web server. It is not recommended to put Node in front as production webserver. Hence you should always run Bread on your server behind a firewall and behind your production webserver. 
Deploy embeddocs.html and embedsheets.html into a webserver such as IIS, Apache etc. The webserver for this example, should be on same machine where Bread is installed.
Now simply browse your website url and you should see the Bread editor show up. 
Your website url can be http://localhost:yourport/embeddocs.html and http://localhost:yourport/embedsheets.html
Note- The username in this example is hardcoded as John and also this sample is running in basic non session mode, which means no security is enabled.


To change the height/width of editor, change the height/width like below. Height/Width can be in % or px.
_breadsheet.push(['width', '100%']);
_breadsheet.push(['height', '100%']);


To change the name of user or change the color assigned to user, change the parameters below:
_breadsheet.push(['userName', 'Sam']);


To enable/disable Print button on editor, change parameters below:
_breadsheet.push(['showPrint', 'No']);


To load a particular tab on editor on load, change parameters below:
_breadsheet.push(['loadTab', 'chat']);

