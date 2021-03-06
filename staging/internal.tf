resource "aws_instance" "internal" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.medium"
  subnet_id       = "${aws_subnet.private_1d.id}"
  key_name        = "${aws_key_pair.internal.key_name}"
  security_groups = ["${aws_security_group.internal.id}"]

  tags {
    Name        = "${var.short_env}-${var.app_name}-internal"
    Environment = "${var.environment}"
    App         = "${var.app_name}"
  }
}
