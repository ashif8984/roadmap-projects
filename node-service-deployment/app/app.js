const http = require('http');
const port = 9000;


http.createServer(function (req, res) {
  res.end('Hello My Ashif World');
}).listen(port, () => {
    console.log(`Server running at port = ${port}`);
  }); 