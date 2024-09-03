FROM swaggerapi/swagger-ui:v5.3.1
COPY api/judge/to_backend.yaml /api/judge/to_backend.yaml
ENV SWAGGER_JSON=/api/judge/to_backend.yaml