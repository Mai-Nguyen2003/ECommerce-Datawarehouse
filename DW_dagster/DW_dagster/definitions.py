from dagster import Definitions,ScheduleDefinition, define_asset_job
from dagster_dbt import DbtCliResource
from .dbt import ecom_dbt_dbt_assets
from .airbyte import airbyte_assets
from .project import ecom_dbt_project
from .schedules import schedules
import os
from pathlib import Path

defs = Definitions(
    assets=[ecom_dbt_dbt_assets,airbyte_assets],
    schedules=[ScheduleDefinition(
        job = define_asset_job("all_assets", selection="*"),cron_schedule="0 */6 * * *")],
    resources={
        "dbt": DbtCliResource(project_dir=ecom_dbt_project,
                              profiles_dir= Path(os.path.expanduser("~")).joinpath(".dbt").resolve())
    },
)
