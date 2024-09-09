FROM swaggerapi/swagger-ui:v5.3.1
COPY api/judge/to_backend.yaml /openapi.yaml
ENV SWAGGER_JSON=/openapi.yaml