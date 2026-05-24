FROM node:18-slim

RUN apt-get update &&     apt-get install -y     openjdk-17-jdk     gradle     maven     unzip     && apt-get clean     && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN java -version && gradle -v && mvn -v

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN mkdir -p uploads downloads history
EXPOSE 3000
CMD ["npm", "start"]