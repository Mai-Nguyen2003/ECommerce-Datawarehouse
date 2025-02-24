from pathlib import Path
import os
from dagster._utils import file_relative_path

from dagster_dbt import DbtProject

ecom_dbt_project = DbtProject(
    project_dir=Path(__file__).joinpath("..","..","..").resolve(),
    packaged_project_dir=Path(__file__).joinpath("..","..","..").resolve(),
)

# Airbyte configs
AIRBYTE_CONNECTION_ID = os.environ.get("AIRBYTE_CONNECTION_ID", "ed0a3897-7504-4829-bdfe-4a656335895e")


AIRBYTE_CONFIG = {
    "host": os.environ.get("AIRBYTE_HOST", "localhost"),
    "port": os.environ.get("AIRBYTE_PORT", "8000"),
    "username":  "mai3008.work@gmail.com", 
    "password":  "Tm30082003",
}





