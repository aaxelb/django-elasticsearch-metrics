from django.dispatch import Signal


# Sent before index template is created in elasticsearch,
# with args (Metric, index_template, using)
pre_index_template_create = Signal()

# Sent after index template is created in elasticsearch,
# with args (Metric, index_template, using)
post_index_template_create = Signal()

# Sent at the beginning of Metric's save(),
# with args (Metric, instance, using, index)
pre_save = Signal()

# Like pre_save, but sent at the end of the save() method,
# with args (Metric, instance, using, index)
post_save = Signal()
