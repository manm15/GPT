FROM node:18-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN chown -R appuser:appgroup /app
EXPOSE 80/udp
EXPOSE 80/tcp
EXPOSE 8080/udp
EXPOSE 8080/tcp
USER appuser
CMD [ "npm", "start" ]
