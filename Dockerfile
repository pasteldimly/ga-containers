FROM node:20 AS base

ENV MONGODB_CONNECTION_PROTOCOL mongodb+srv
ENV MONGODB_DB_NAME gha-demo1
ENV MONGODB_CLUSTER_ADDRESS cluster0.ntrwp.mongodb.net
ENV MONGODB_USERNAME maximilian
ENV MONGODB_PASSWORD eI3R3UfNlJgWJe17

COPY . /app
WORKDIR /app
RUN npm ci

# distroless
FROM gcr.io/distroless/nodejs20-debian12
COPY --from=base /app /app
WORKDIR /app

ENTRYPOINT ["npm"]
CMD ["start"]
