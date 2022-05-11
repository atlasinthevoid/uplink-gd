use chrono::Utc;
use super::Capability;

impl Capability {
    pub fn new_creation_time() -> Capability {
        let mut c = Capability::new();
        c.data.string.insert("type".to_string(), "creation_time".to_string());
        c.data.date_time.insert("creation_time".to_string(), Utc::now());
        c
    }
}