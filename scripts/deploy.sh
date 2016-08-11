# switch to builder directory
cd ../builder

# install libraries
npm install

# Execute the swagger builder
node swagger-builder.js

cd ..

ls -al swagger-file.json
