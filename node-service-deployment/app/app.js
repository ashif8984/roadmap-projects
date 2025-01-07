const http = require('http');
const port = 9000;


http.createServer(function (req, res) {
  res.end('<h1>This is a Node js server</h1>');
}).listen(port, () => {
    console.log(`Server running at port = ${port}`);
  }); 