const express = require('express');
const dotenv = require('dotenv');
const auth = require('basic-auth')

const session = require('express-session');

dotenv.config({ path: './config.env' });
const app = express();
const port = 9000;


app.use('/secret', (req, res, next) => {
  let user = auth(req)
  if (user === undefined || user['name'] !== process.env.SECRET_USERNAME || user['pass'] !== process.env.SECRET_PASSWORD) {
    res.statusCode = 401
    res.setHeader('WWW-Authenticate', 'Basic realm="Node"')
    res.setHeader('set-cookie', 'value=true', MaxAge="1000*60");
    res.end('Unauthorized')
  } else {
    next()
  }
})

// Protected Route
app.get('/secret' , (req, res) => {
  res.send(process.env.SECRET_MESSAGE);
});


// Normal Route
app.get('/', (req, res) => {
  res.send('Hello, world!');
});


app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
