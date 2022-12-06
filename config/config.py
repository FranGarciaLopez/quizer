import os
def load_config(mode=os.environ.get('MODE')):
    """Load config."""
    if mode == 'production':
        from .production import ProductionConfig
        return ProductionConfig
    elif mode == 'testing':
        from .testing import TestingConfig
        return TestingConfig
    elif mode == 'development':
        from .development import DevelopmentConfig
        return DevelopmentConfig
    else:
        from .default import Config
        return Config