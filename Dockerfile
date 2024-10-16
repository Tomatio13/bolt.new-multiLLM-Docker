FROM nginx:latest

WORKDIR /app

# INSTALL npm
RUN apt-get update 
#:RUN apt-get search npm
RUN apt-get install -y nodejs npm 
RUN apt-get install -y git
RUN npm install -g n
RUN n latest
RUN apt purge -y nodejs npm
RUN apt autoremove -y

# nginx
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# INSTLL pnpm
RUN npm install -g pnpm

# bolt.new Clone
RUN git clone https://github.com/Tomatio13/bolt.new-multiLLM.git .
COPY env.local.docker .env.local
COPY llms.json app

# build
RUN pnpm install
RUN pnpm build

#EXPOSE 8788

#ENTRYPOINT ["pnpm", "start"]
CMD nginx && pnpm start
