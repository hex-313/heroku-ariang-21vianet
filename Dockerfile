FROM node:lts-buster

COPY setup.sh .
RUN bash setup.sh
COPY . .
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"] node:lts-buster

WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN bash setup.sh
CMD ["bash", "start.sh"]
