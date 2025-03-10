from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import ecom_dbt_project


@dbt_assets(manifest=ecom_dbt_project.manifest_path)
def ecom_dbt_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    