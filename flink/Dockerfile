FROM flink:2.2.0-scala_2.12-java17

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

WORKDIR /opt/pyflink

COPY pyproject.flink.toml pyproject.toml

RUN uv python install 3.11 && uv sync

ENV PATH="/opt/pyflink/.venv/bin:$PATH"

WORKDIR /opt/flink/lib

ARG MAVEN_REPO=https://repo.maven.apache.org/maven2

RUN wget -q ${MAVEN_REPO}/org/apache/flink/flink-sql-connector-kafka/4.0.1-2.0/flink-sql-connector-kafka-4.0.1-2.0.jar
RUN wget -q ${MAVEN_REPO}/com/clickhouse/flink/flink-connector-clickhouse-2.0.0/0.1.3/flink-connector-clickhouse-2.0.0-0.1.3-all.jar
RUN wget -q ${MAVEN_REPO}/org/apache/flink/flink-avro/2.2.0/flink-avro-2.2.0.jar && \
    wget -q ${MAVEN_REPO}/org/apache/flink/flink-avro-confluent-registry/2.2.0/flink-avro-confluent-registry-2.2.0.jar

# Copy custom Flink config
COPY flink-config.yaml /opt/flink/conf/config.yaml

WORKDIR /opt/flink
