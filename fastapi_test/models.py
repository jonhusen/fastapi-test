from typing import Optional

from pydantic import BaseModel

class User(BaseModel):
    id: Optional[int]
    display_name: str
    name: str
    given_name: str
    email_address: str
    home_drive: str
    uid: int
