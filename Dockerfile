FROM mongo:latest
RUN killall mongod
ARG SOURCE_CONFIG_FILE=/db/config/config.yaml
ARG TARGET_CONFIG_FILE=/db/config/config.yaml
COPY $SOURCE_CONFIG_FILE $TARGET_CONFIG_FILE
CMD mongod --config=$TARGET_CONFIG_FILE
