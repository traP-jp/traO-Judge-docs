FROM swaggerapi/swagger-ui:v5.3.1
COPY to_judge.yaml /openapi.yaml
ENV SWAGGER_JSON=/openapi.yaml