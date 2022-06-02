import * as dotenv from 'dotenv';
import cors from 'cors';
import express from 'express';
import { sequelize } from './sequelize';

import { IndexRouter } from './controllers/v0/index.router';

import bodyParser from 'body-parser';
import { V0_FEED_MODELS, V0_USER_MODELS } from './controllers/v0/model.index';
import path from 'path';

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
(async () => {
	dotenv.config({ path: path.join(__dirname, '../../../.env') });

	await sequelize.addModels(V0_FEED_MODELS);
	await sequelize.addModels(V0_USER_MODELS);
	await sequelize.sync();

	console.log('Database Connected');

	const app = express();
	const port = process.env.PORT || 8080;

	app.use(bodyParser.json());

	app.use(cors());

	app.use('/api/v0/', IndexRouter);

	// Root URI call
	app.get('/', async (req, res) => {
		res.send('/api/v0/');
	});

	// Start the Server
	app.listen(port, () => {
		// check current environment
		let liveUrl = `${process.env.URL}`;
		if (process.env.ENV === 'dev') {
			liveUrl = `http://${process.env.SERVER_HOST}:${port}/`;
		}

		console.log(`server running ${liveUrl}`);
		console.log('press CTRL+C to stop server');
	});
})();
