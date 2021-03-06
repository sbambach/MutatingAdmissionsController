
import * as Koa from 'koa';
import * as KoaRouter from 'koa-router';
import { objectCreate } from './objectCreate';

export function registerRoutes(app: Koa) {

    const router = new KoaRouter();

    router.post("/", objectCreate);
    router.get("/healthz", (ctx) => {
        ctx.body = "Alive!"
    });

    app.use(router.routes());
    app.use(router.allowedMethods());

}
